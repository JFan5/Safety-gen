(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v7 ?v12)
             (pred_6 ?v2 ?v13)
             (pred_2 ?v7 ?v13)
             (pred_3 ?v6 ?v7 )
	     (pred_8 ?v7)
             (pred_7 ?v9)
             (pred_10 ?v2)
             (pred_1 ?v13)
             (pred_5 ?v7)
             (pred_12 ?v2)
             (pred_11 ?v7)
             (pred_9 ))



(:action op_5
:parameters (?v3 ?v10 ?v11 ?v1)
:precondition (and (pred_7 ?v3) (pred_7 ?v10) (pred_10 ?v11) (pred_1 ?v1)
          (pred_4 ?v3 ?v10) (pred_6 ?v11 ?v1)
                   (pred_2 ?v10 ?v1) (pred_8 ?v3) 
                   (pred_5 ?v10) (pred_12 ?v11))
:effect (and  (pred_11 ?v10) (not (pred_5 ?v10))))


(:action op_2
:parameters (?v3 ?v4)
:precondition (and (pred_7 ?v3) (pred_7 ?v4)
               (pred_8 ?v3) (pred_4 ?v3 ?v4) (pred_11 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v3))))

(:action op_4
:parameters (?v3 ?v11)
:precondition (and (pred_7 ?v3) (pred_10 ?v11) 
                  (pred_8 ?v3) (pred_3 ?v11 ?v3) (pred_9 ))
:effect (and (pred_12 ?v11)
   (not (pred_3 ?v11 ?v3)) (not (pred_9 ))))


(:action op_3
:parameters (?v3 ?v8 ?v5)
:precondition (and (pred_7 ?v3) (pred_10 ?v8) (pred_10 ?v5)
                  (pred_8 ?v3) (pred_12 ?v5) (pred_3 ?v8 ?v3))
:effect (and (pred_12 ?v8) (pred_3 ?v5 ?v3)
        (not (pred_12 ?v5)) (not (pred_3 ?v8 ?v3))))

(:action op_1
:parameters (?v3 ?v11)
:precondition (and (pred_7 ?v3) (pred_10 ?v11) 
                  (pred_8 ?v3) (pred_12 ?v11))
:effect (and (pred_9 ) (pred_3 ?v11 ?v3) (not (pred_12 ?v11)))))


	
