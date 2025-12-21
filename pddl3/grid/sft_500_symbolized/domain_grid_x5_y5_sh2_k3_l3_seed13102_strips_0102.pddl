(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v10)
             (pred_6 ?v8 ?v3)
             (pred_11 ?v2 ?v3)
             (pred_1 ?v1 ?v2 )
	     (pred_7 ?v2)
             (pred_9 ?v4)
             (pred_8 ?v8)
             (pred_12 ?v3)
             (pred_3 ?v2)
             (pred_5 ?v8)
             (pred_4 ?v2)
             (pred_2 ))



(:action op_4
:parameters (?v12 ?v6 ?v5 ?v7)
:precondition (and (pred_9 ?v12) (pred_9 ?v6) (pred_8 ?v5) (pred_12 ?v7)
          (pred_10 ?v12 ?v6) (pred_6 ?v5 ?v7)
                   (pred_11 ?v6 ?v7) (pred_7 ?v12) 
                   (pred_3 ?v6) (pred_5 ?v5))
:effect (and  (pred_4 ?v6) (not (pred_3 ?v6))))


(:action op_2
:parameters (?v12 ?v11)
:precondition (and (pred_9 ?v12) (pred_9 ?v11)
               (pred_7 ?v12) (pred_10 ?v12 ?v11) (pred_4 ?v11))
:effect (and (pred_7 ?v11) (not (pred_7 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_9 ?v12) (pred_8 ?v5) 
                  (pred_7 ?v12) (pred_1 ?v5 ?v12) (pred_2 ))
:effect (and (pred_5 ?v5)
   (not (pred_1 ?v5 ?v12)) (not (pred_2 ))))


(:action op_3
:parameters (?v12 ?v9 ?v13)
:precondition (and (pred_9 ?v12) (pred_8 ?v9) (pred_8 ?v13)
                  (pred_7 ?v12) (pred_5 ?v13) (pred_1 ?v9 ?v12))
:effect (and (pred_5 ?v9) (pred_1 ?v13 ?v12)
        (not (pred_5 ?v13)) (not (pred_1 ?v9 ?v12))))

(:action op_1
:parameters (?v12 ?v5)
:precondition (and (pred_9 ?v12) (pred_8 ?v5) 
                  (pred_7 ?v12) (pred_5 ?v5))
:effect (and (pred_2 ) (pred_1 ?v5 ?v12) (not (pred_5 ?v5)))))


	
