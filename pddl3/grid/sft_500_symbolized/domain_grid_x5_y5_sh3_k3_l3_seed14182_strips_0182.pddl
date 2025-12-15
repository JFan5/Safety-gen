(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v6 ?v4)
             (pred_4 ?v1 ?v8)
             (pred_11 ?v6 ?v8)
             (pred_8 ?v3 ?v6 )
	     (pred_10 ?v6)
             (pred_2 ?v5)
             (pred_7 ?v1)
             (pred_12 ?v8)
             (pred_3 ?v6)
             (pred_1 ?v1)
             (pred_5 ?v6)
             (pred_6 ))



(:action op_5
:parameters (?v12 ?v9 ?v13 ?v7)
:precondition (and (pred_2 ?v12) (pred_2 ?v9) (pred_7 ?v13) (pred_12 ?v7)
          (pred_9 ?v12 ?v9) (pred_4 ?v13 ?v7)
                   (pred_11 ?v9 ?v7) (pred_10 ?v12) 
                   (pred_3 ?v9) (pred_1 ?v13))
:effect (and  (pred_5 ?v9) (not (pred_3 ?v9))))


(:action op_3
:parameters (?v12 ?v10)
:precondition (and (pred_2 ?v12) (pred_2 ?v10)
               (pred_10 ?v12) (pred_9 ?v12 ?v10) (pred_5 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v12))))

(:action op_1
:parameters (?v12 ?v13)
:precondition (and (pred_2 ?v12) (pred_7 ?v13) 
                  (pred_10 ?v12) (pred_8 ?v13 ?v12) (pred_6 ))
:effect (and (pred_1 ?v13)
   (not (pred_8 ?v13 ?v12)) (not (pred_6 ))))


(:action op_2
:parameters (?v12 ?v2 ?v11)
:precondition (and (pred_2 ?v12) (pred_7 ?v2) (pred_7 ?v11)
                  (pred_10 ?v12) (pred_1 ?v11) (pred_8 ?v2 ?v12))
:effect (and (pred_1 ?v2) (pred_8 ?v11 ?v12)
        (not (pred_1 ?v11)) (not (pred_8 ?v2 ?v12))))

(:action op_4
:parameters (?v12 ?v13)
:precondition (and (pred_2 ?v12) (pred_7 ?v13) 
                  (pred_10 ?v12) (pred_1 ?v13))
:effect (and (pred_6 ) (pred_8 ?v13 ?v12) (not (pred_1 ?v13)))))


	
