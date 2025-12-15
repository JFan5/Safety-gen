(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v3 ?v8)
             (pred_4 ?v2 ?v1)
             (pred_1 ?v3 ?v1)
             (pred_10 ?v13 ?v3 )
	     (pred_12 ?v3)
             (pred_3 ?v4)
             (pred_6 ?v2)
             (pred_7 ?v1)
             (pred_9 ?v3)
             (pred_8 ?v2)
             (pred_5 ?v3)
             (pred_2 ))



(:action op_4
:parameters (?v10 ?v9 ?v5 ?v12)
:precondition (and (pred_3 ?v10) (pred_3 ?v9) (pred_6 ?v5) (pred_7 ?v12)
          (pred_11 ?v10 ?v9) (pred_4 ?v5 ?v12)
                   (pred_1 ?v9 ?v12) (pred_12 ?v10) 
                   (pred_9 ?v9) (pred_8 ?v5))
:effect (and  (pred_5 ?v9) (not (pred_9 ?v9))))


(:action op_5
:parameters (?v10 ?v11)
:precondition (and (pred_3 ?v10) (pred_3 ?v11)
               (pred_12 ?v10) (pred_11 ?v10 ?v11) (pred_5 ?v11))
:effect (and (pred_12 ?v11) (not (pred_12 ?v10))))

(:action op_3
:parameters (?v10 ?v5)
:precondition (and (pred_3 ?v10) (pred_6 ?v5) 
                  (pred_12 ?v10) (pred_10 ?v5 ?v10) (pred_2 ))
:effect (and (pred_8 ?v5)
   (not (pred_10 ?v5 ?v10)) (not (pred_2 ))))


(:action op_1
:parameters (?v10 ?v7 ?v6)
:precondition (and (pred_3 ?v10) (pred_6 ?v7) (pred_6 ?v6)
                  (pred_12 ?v10) (pred_8 ?v6) (pred_10 ?v7 ?v10))
:effect (and (pred_8 ?v7) (pred_10 ?v6 ?v10)
        (not (pred_8 ?v6)) (not (pred_10 ?v7 ?v10))))

(:action op_2
:parameters (?v10 ?v5)
:precondition (and (pred_3 ?v10) (pred_6 ?v5) 
                  (pred_12 ?v10) (pred_8 ?v5))
:effect (and (pred_2 ) (pred_10 ?v5 ?v10) (not (pred_8 ?v5)))))


	
