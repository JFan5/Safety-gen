(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v1 ?v10)
             (pred_7 ?v6 ?v9)
             (pred_11 ?v1 ?v9)
             (pred_3 ?v8 ?v1 )
	     (pred_2 ?v1)
             (pred_10 ?v4)
             (pred_12 ?v6)
             (pred_8 ?v9)
             (pred_4 ?v1)
             (pred_9 ?v6)
             (pred_1 ?v1)
             (pred_6 ))



(:action op_2
:parameters (?v12 ?v3 ?v5 ?v13)
:precondition (and (pred_10 ?v12) (pred_10 ?v3) (pred_12 ?v5) (pred_8 ?v13)
          (pred_5 ?v12 ?v3) (pred_7 ?v5 ?v13)
                   (pred_11 ?v3 ?v13) (pred_2 ?v12) 
                   (pred_4 ?v3) (pred_9 ?v5))
:effect (and  (pred_1 ?v3) (not (pred_4 ?v3))))


(:action op_3
:parameters (?v12 ?v7)
:precondition (and (pred_10 ?v12) (pred_10 ?v7)
               (pred_2 ?v12) (pred_5 ?v12 ?v7) (pred_1 ?v7))
:effect (and (pred_2 ?v7) (not (pred_2 ?v12))))

(:action op_4
:parameters (?v12 ?v5)
:precondition (and (pred_10 ?v12) (pred_12 ?v5) 
                  (pred_2 ?v12) (pred_3 ?v5 ?v12) (pred_6 ))
:effect (and (pred_9 ?v5)
   (not (pred_3 ?v5 ?v12)) (not (pred_6 ))))


(:action op_1
:parameters (?v12 ?v11 ?v2)
:precondition (and (pred_10 ?v12) (pred_12 ?v11) (pred_12 ?v2)
                  (pred_2 ?v12) (pred_9 ?v2) (pred_3 ?v11 ?v12))
:effect (and (pred_9 ?v11) (pred_3 ?v2 ?v12)
        (not (pred_9 ?v2)) (not (pred_3 ?v11 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_10 ?v12) (pred_12 ?v5) 
                  (pred_2 ?v12) (pred_9 ?v5))
:effect (and (pred_6 ) (pred_3 ?v5 ?v12) (not (pred_9 ?v5)))))


	
