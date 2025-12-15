(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v5 ?v11)
             (pred_7 ?v7 ?v9)
             (pred_4 ?v5 ?v9)
             (pred_5 ?v1 ?v5 )
	     (pred_8 ?v5)
             (pred_10 ?v13)
             (pred_9 ?v7)
             (pred_6 ?v9)
             (pred_2 ?v5)
             (pred_3 ?v7)
             (pred_11 ?v5)
             (pred_1 ))



(:action op_2
:parameters (?v3 ?v8 ?v2 ?v10)
:precondition (and (pred_10 ?v3) (pred_10 ?v8) (pred_9 ?v2) (pred_6 ?v10)
          (pred_12 ?v3 ?v8) (pred_7 ?v2 ?v10)
                   (pred_4 ?v8 ?v10) (pred_8 ?v3) 
                   (pred_2 ?v8) (pred_3 ?v2))
:effect (and  (pred_11 ?v8) (not (pred_2 ?v8))))


(:action op_1
:parameters (?v3 ?v4)
:precondition (and (pred_10 ?v3) (pred_10 ?v4)
               (pred_8 ?v3) (pred_12 ?v3 ?v4) (pred_11 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v3))))

(:action op_5
:parameters (?v3 ?v2)
:precondition (and (pred_10 ?v3) (pred_9 ?v2) 
                  (pred_8 ?v3) (pred_5 ?v2 ?v3) (pred_1 ))
:effect (and (pred_3 ?v2)
   (not (pred_5 ?v2 ?v3)) (not (pred_1 ))))


(:action op_3
:parameters (?v3 ?v6 ?v12)
:precondition (and (pred_10 ?v3) (pred_9 ?v6) (pred_9 ?v12)
                  (pred_8 ?v3) (pred_3 ?v12) (pred_5 ?v6 ?v3))
:effect (and (pred_3 ?v6) (pred_5 ?v12 ?v3)
        (not (pred_3 ?v12)) (not (pred_5 ?v6 ?v3))))

(:action op_4
:parameters (?v3 ?v2)
:precondition (and (pred_10 ?v3) (pred_9 ?v2) 
                  (pred_8 ?v3) (pred_3 ?v2))
:effect (and (pred_1 ) (pred_5 ?v2 ?v3) (not (pred_3 ?v2)))))


	
