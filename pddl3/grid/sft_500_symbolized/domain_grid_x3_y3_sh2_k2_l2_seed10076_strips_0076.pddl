(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v11 ?v6)
             (pred_4 ?v4 ?v1)
             (pred_9 ?v11 ?v1)
             (pred_7 ?v13 ?v11 )
	     (pred_6 ?v11)
             (pred_10 ?v12)
             (pred_3 ?v4)
             (pred_2 ?v1)
             (pred_8 ?v11)
             (pred_12 ?v4)
             (pred_1 ?v11)
             (pred_5 ))



(:action op_5
:parameters (?v10 ?v3 ?v5 ?v7)
:precondition (and (pred_10 ?v10) (pred_10 ?v3) (pred_3 ?v5) (pred_2 ?v7)
          (pred_11 ?v10 ?v3) (pred_4 ?v5 ?v7)
                   (pred_9 ?v3 ?v7) (pred_6 ?v10) 
                   (pred_8 ?v3) (pred_12 ?v5))
:effect (and  (pred_1 ?v3) (not (pred_8 ?v3))))


(:action op_1
:parameters (?v10 ?v2)
:precondition (and (pred_10 ?v10) (pred_10 ?v2)
               (pred_6 ?v10) (pred_11 ?v10 ?v2) (pred_1 ?v2))
:effect (and (pred_6 ?v2) (not (pred_6 ?v10))))

(:action op_4
:parameters (?v10 ?v5)
:precondition (and (pred_10 ?v10) (pred_3 ?v5) 
                  (pred_6 ?v10) (pred_7 ?v5 ?v10) (pred_5 ))
:effect (and (pred_12 ?v5)
   (not (pred_7 ?v5 ?v10)) (not (pred_5 ))))


(:action op_2
:parameters (?v10 ?v9 ?v8)
:precondition (and (pred_10 ?v10) (pred_3 ?v9) (pred_3 ?v8)
                  (pred_6 ?v10) (pred_12 ?v8) (pred_7 ?v9 ?v10))
:effect (and (pred_12 ?v9) (pred_7 ?v8 ?v10)
        (not (pred_12 ?v8)) (not (pred_7 ?v9 ?v10))))

(:action op_3
:parameters (?v10 ?v5)
:precondition (and (pred_10 ?v10) (pred_3 ?v5) 
                  (pred_6 ?v10) (pred_12 ?v5))
:effect (and (pred_5 ) (pred_7 ?v5 ?v10) (not (pred_12 ?v5)))))


	
