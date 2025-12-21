(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v6 ?v2)
             (pred_6 ?v3 ?v4)
             (pred_8 ?v6 ?v4)
             (pred_3 ?v8 ?v6 )
	     (pred_11 ?v6)
             (pred_7 ?v1)
             (pred_1 ?v3)
             (pred_4 ?v4)
             (pred_9 ?v6)
             (pred_10 ?v3)
             (pred_12 ?v6)
             (pred_5 ))



(:action op_3
:parameters (?v12 ?v9 ?v5 ?v7)
:precondition (and (pred_7 ?v12) (pred_7 ?v9) (pred_1 ?v5) (pred_4 ?v7)
          (pred_2 ?v12 ?v9) (pred_6 ?v5 ?v7)
                   (pred_8 ?v9 ?v7) (pred_11 ?v12) 
                   (pred_9 ?v9) (pred_10 ?v5))
:effect (and  (pred_12 ?v9) (not (pred_9 ?v9))))


(:action op_1
:parameters (?v12 ?v11)
:precondition (and (pred_7 ?v12) (pred_7 ?v11)
               (pred_11 ?v12) (pred_2 ?v12 ?v11) (pred_12 ?v11))
:effect (and (pred_11 ?v11) (not (pred_11 ?v12))))

(:action op_2
:parameters (?v12 ?v5)
:precondition (and (pred_7 ?v12) (pred_1 ?v5) 
                  (pred_11 ?v12) (pred_3 ?v5 ?v12) (pred_5 ))
:effect (and (pred_10 ?v5)
   (not (pred_3 ?v5 ?v12)) (not (pred_5 ))))


(:action op_5
:parameters (?v12 ?v13 ?v10)
:precondition (and (pred_7 ?v12) (pred_1 ?v13) (pred_1 ?v10)
                  (pred_11 ?v12) (pred_10 ?v10) (pred_3 ?v13 ?v12))
:effect (and (pred_10 ?v13) (pred_3 ?v10 ?v12)
        (not (pred_10 ?v10)) (not (pred_3 ?v13 ?v12))))

(:action op_4
:parameters (?v12 ?v5)
:precondition (and (pred_7 ?v12) (pred_1 ?v5) 
                  (pred_11 ?v12) (pred_10 ?v5))
:effect (and (pred_5 ) (pred_3 ?v5 ?v12) (not (pred_10 ?v5)))))


	
