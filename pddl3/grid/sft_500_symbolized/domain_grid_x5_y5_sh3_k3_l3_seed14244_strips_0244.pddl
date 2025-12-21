(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v12)
             (pred_5 ?v2 ?v8)
             (pred_6 ?v13 ?v8)
             (pred_8 ?v11 ?v13 )
	     (pred_10 ?v13)
             (pred_1 ?v6)
             (pred_7 ?v2)
             (pred_4 ?v8)
             (pred_11 ?v13)
             (pred_12 ?v2)
             (pred_3 ?v13)
             (pred_9 ))



(:action op_3
:parameters (?v10 ?v3 ?v9 ?v5)
:precondition (and (pred_1 ?v10) (pred_1 ?v3) (pred_7 ?v9) (pred_4 ?v5)
          (pred_2 ?v10 ?v3) (pred_5 ?v9 ?v5)
                   (pred_6 ?v3 ?v5) (pred_10 ?v10) 
                   (pred_11 ?v3) (pred_12 ?v9))
:effect (and  (pred_3 ?v3) (not (pred_11 ?v3))))


(:action op_2
:parameters (?v10 ?v1)
:precondition (and (pred_1 ?v10) (pred_1 ?v1)
               (pred_10 ?v10) (pred_2 ?v10 ?v1) (pred_3 ?v1))
:effect (and (pred_10 ?v1) (not (pred_10 ?v10))))

(:action op_1
:parameters (?v10 ?v9)
:precondition (and (pred_1 ?v10) (pred_7 ?v9) 
                  (pred_10 ?v10) (pred_8 ?v9 ?v10) (pred_9 ))
:effect (and (pred_12 ?v9)
   (not (pred_8 ?v9 ?v10)) (not (pred_9 ))))


(:action op_4
:parameters (?v10 ?v7 ?v4)
:precondition (and (pred_1 ?v10) (pred_7 ?v7) (pred_7 ?v4)
                  (pred_10 ?v10) (pred_12 ?v4) (pred_8 ?v7 ?v10))
:effect (and (pred_12 ?v7) (pred_8 ?v4 ?v10)
        (not (pred_12 ?v4)) (not (pred_8 ?v7 ?v10))))

(:action op_5
:parameters (?v10 ?v9)
:precondition (and (pred_1 ?v10) (pred_7 ?v9) 
                  (pred_10 ?v10) (pred_12 ?v9))
:effect (and (pred_9 ) (pred_8 ?v9 ?v10) (not (pred_12 ?v9)))))


	
