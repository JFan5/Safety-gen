(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v1 ?v4)
             (pred_2 ?v5 ?v10)
             (pred_11 ?v1 ?v10)
             (pred_7 ?v13 ?v1 )
	     (pred_3 ?v1)
             (pred_9 ?v9)
             (pred_10 ?v5)
             (pred_1 ?v10)
             (pred_4 ?v1)
             (pred_8 ?v5)
             (pred_6 ?v1)
             (pred_12 ))



(:action op_4
:parameters (?v12 ?v6 ?v3 ?v2)
:precondition (and (pred_9 ?v12) (pred_9 ?v6) (pred_10 ?v3) (pred_1 ?v2)
          (pred_5 ?v12 ?v6) (pred_2 ?v3 ?v2)
                   (pred_11 ?v6 ?v2) (pred_3 ?v12) 
                   (pred_4 ?v6) (pred_8 ?v3))
:effect (and  (pred_6 ?v6) (not (pred_4 ?v6))))


(:action op_1
:parameters (?v12 ?v8)
:precondition (and (pred_9 ?v12) (pred_9 ?v8)
               (pred_3 ?v12) (pred_5 ?v12 ?v8) (pred_6 ?v8))
:effect (and (pred_3 ?v8) (not (pred_3 ?v12))))

(:action op_2
:parameters (?v12 ?v3)
:precondition (and (pred_9 ?v12) (pred_10 ?v3) 
                  (pred_3 ?v12) (pred_7 ?v3 ?v12) (pred_12 ))
:effect (and (pred_8 ?v3)
   (not (pred_7 ?v3 ?v12)) (not (pred_12 ))))


(:action op_5
:parameters (?v12 ?v11 ?v7)
:precondition (and (pred_9 ?v12) (pred_10 ?v11) (pred_10 ?v7)
                  (pred_3 ?v12) (pred_8 ?v7) (pred_7 ?v11 ?v12))
:effect (and (pred_8 ?v11) (pred_7 ?v7 ?v12)
        (not (pred_8 ?v7)) (not (pred_7 ?v11 ?v12))))

(:action op_3
:parameters (?v12 ?v3)
:precondition (and (pred_9 ?v12) (pred_10 ?v3) 
                  (pred_3 ?v12) (pred_8 ?v3))
:effect (and (pred_12 ) (pred_7 ?v3 ?v12) (not (pred_8 ?v3)))))


	
