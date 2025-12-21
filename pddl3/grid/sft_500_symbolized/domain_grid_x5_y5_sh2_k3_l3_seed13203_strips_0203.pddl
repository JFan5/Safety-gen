(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v3 ?v5)
             (pred_10 ?v8 ?v6)
             (pred_7 ?v3 ?v6)
             (pred_11 ?v1 ?v3 )
	     (pred_1 ?v3)
             (pred_5 ?v10)
             (pred_12 ?v8)
             (pred_6 ?v6)
             (pred_9 ?v3)
             (pred_4 ?v8)
             (pred_8 ?v3)
             (pred_2 ))



(:action op_3
:parameters (?v12 ?v9 ?v7 ?v2)
:precondition (and (pred_5 ?v12) (pred_5 ?v9) (pred_12 ?v7) (pred_6 ?v2)
          (pred_3 ?v12 ?v9) (pred_10 ?v7 ?v2)
                   (pred_7 ?v9 ?v2) (pred_1 ?v12) 
                   (pred_9 ?v9) (pred_4 ?v7))
:effect (and  (pred_8 ?v9) (not (pred_9 ?v9))))


(:action op_5
:parameters (?v12 ?v13)
:precondition (and (pred_5 ?v12) (pred_5 ?v13)
               (pred_1 ?v12) (pred_3 ?v12 ?v13) (pred_8 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v12))))

(:action op_4
:parameters (?v12 ?v7)
:precondition (and (pred_5 ?v12) (pred_12 ?v7) 
                  (pred_1 ?v12) (pred_11 ?v7 ?v12) (pred_2 ))
:effect (and (pred_4 ?v7)
   (not (pred_11 ?v7 ?v12)) (not (pred_2 ))))


(:action op_1
:parameters (?v12 ?v4 ?v11)
:precondition (and (pred_5 ?v12) (pred_12 ?v4) (pred_12 ?v11)
                  (pred_1 ?v12) (pred_4 ?v11) (pred_11 ?v4 ?v12))
:effect (and (pred_4 ?v4) (pred_11 ?v11 ?v12)
        (not (pred_4 ?v11)) (not (pred_11 ?v4 ?v12))))

(:action op_2
:parameters (?v12 ?v7)
:precondition (and (pred_5 ?v12) (pred_12 ?v7) 
                  (pred_1 ?v12) (pred_4 ?v7))
:effect (and (pred_2 ) (pred_11 ?v7 ?v12) (not (pred_4 ?v7)))))


	
