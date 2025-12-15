(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v11 ?v6)
             (pred_11 ?v12 ?v2)
             (pred_9 ?v11 ?v2)
             (pred_6 ?v7 ?v11 )
	     (pred_5 ?v11)
             (pred_10 ?v9)
             (pred_2 ?v12)
             (pred_3 ?v2)
             (pred_12 ?v11)
             (pred_8 ?v12)
             (pred_7 ?v11)
             (pred_1 ))



(:action op_3
:parameters (?v3 ?v10 ?v1 ?v4)
:precondition (and (pred_10 ?v3) (pred_10 ?v10) (pred_2 ?v1) (pred_3 ?v4)
          (pred_4 ?v3 ?v10) (pred_11 ?v1 ?v4)
                   (pred_9 ?v10 ?v4) (pred_5 ?v3) 
                   (pred_12 ?v10) (pred_8 ?v1))
:effect (and  (pred_7 ?v10) (not (pred_12 ?v10))))


(:action op_5
:parameters (?v3 ?v5)
:precondition (and (pred_10 ?v3) (pred_10 ?v5)
               (pred_5 ?v3) (pred_4 ?v3 ?v5) (pred_7 ?v5))
:effect (and (pred_5 ?v5) (not (pred_5 ?v3))))

(:action op_2
:parameters (?v3 ?v1)
:precondition (and (pred_10 ?v3) (pred_2 ?v1) 
                  (pred_5 ?v3) (pred_6 ?v1 ?v3) (pred_1 ))
:effect (and (pred_8 ?v1)
   (not (pred_6 ?v1 ?v3)) (not (pred_1 ))))


(:action op_4
:parameters (?v3 ?v13 ?v8)
:precondition (and (pred_10 ?v3) (pred_2 ?v13) (pred_2 ?v8)
                  (pred_5 ?v3) (pred_8 ?v8) (pred_6 ?v13 ?v3))
:effect (and (pred_8 ?v13) (pred_6 ?v8 ?v3)
        (not (pred_8 ?v8)) (not (pred_6 ?v13 ?v3))))

(:action op_1
:parameters (?v3 ?v1)
:precondition (and (pred_10 ?v3) (pred_2 ?v1) 
                  (pred_5 ?v3) (pred_8 ?v1))
:effect (and (pred_1 ) (pred_6 ?v1 ?v3) (not (pred_8 ?v1)))))


	
