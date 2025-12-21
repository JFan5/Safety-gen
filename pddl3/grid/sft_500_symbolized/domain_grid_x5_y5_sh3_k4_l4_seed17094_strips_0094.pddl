(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v7 ?v2)
             (pred_12 ?v8 ?v13)
             (pred_1 ?v7 ?v13)
             (pred_3 ?v9 ?v7 )
	     (pred_9 ?v7)
             (pred_4 ?v10)
             (pred_2 ?v8)
             (pred_6 ?v13)
             (pred_5 ?v7)
             (pred_7 ?v8)
             (pred_11 ?v7)
             (pred_8 ))



(:action op_3
:parameters (?v12 ?v6 ?v3 ?v1)
:precondition (and (pred_4 ?v12) (pred_4 ?v6) (pred_2 ?v3) (pred_6 ?v1)
          (pred_10 ?v12 ?v6) (pred_12 ?v3 ?v1)
                   (pred_1 ?v6 ?v1) (pred_9 ?v12) 
                   (pred_5 ?v6) (pred_7 ?v3))
:effect (and  (pred_11 ?v6) (not (pred_5 ?v6))))


(:action op_5
:parameters (?v12 ?v11)
:precondition (and (pred_4 ?v12) (pred_4 ?v11)
               (pred_9 ?v12) (pred_10 ?v12 ?v11) (pred_11 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v12))))

(:action op_1
:parameters (?v12 ?v3)
:precondition (and (pred_4 ?v12) (pred_2 ?v3) 
                  (pred_9 ?v12) (pred_3 ?v3 ?v12) (pred_8 ))
:effect (and (pred_7 ?v3)
   (not (pred_3 ?v3 ?v12)) (not (pred_8 ))))


(:action op_2
:parameters (?v12 ?v4 ?v5)
:precondition (and (pred_4 ?v12) (pred_2 ?v4) (pred_2 ?v5)
                  (pred_9 ?v12) (pred_7 ?v5) (pred_3 ?v4 ?v12))
:effect (and (pred_7 ?v4) (pred_3 ?v5 ?v12)
        (not (pred_7 ?v5)) (not (pred_3 ?v4 ?v12))))

(:action op_4
:parameters (?v12 ?v3)
:precondition (and (pred_4 ?v12) (pred_2 ?v3) 
                  (pred_9 ?v12) (pred_7 ?v3))
:effect (and (pred_8 ) (pred_3 ?v3 ?v12) (not (pred_7 ?v3)))))


	
