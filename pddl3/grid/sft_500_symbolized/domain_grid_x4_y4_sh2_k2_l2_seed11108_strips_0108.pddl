(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v10)
             (pred_1 ?v5 ?v8)
             (pred_8 ?v11 ?v8)
             (pred_9 ?v3 ?v11 )
	     (pred_3 ?v11)
             (pred_2 ?v9)
             (pred_5 ?v5)
             (pred_6 ?v8)
             (pred_12 ?v11)
             (pred_4 ?v5)
             (pred_10 ?v11)
             (pred_11 ))



(:action op_5
:parameters (?v12 ?v7 ?v13 ?v6)
:precondition (and (pred_2 ?v12) (pred_2 ?v7) (pred_5 ?v13) (pred_6 ?v6)
          (pred_7 ?v12 ?v7) (pred_1 ?v13 ?v6)
                   (pred_8 ?v7 ?v6) (pred_3 ?v12) 
                   (pred_12 ?v7) (pred_4 ?v13))
:effect (and  (pred_10 ?v7) (not (pred_12 ?v7))))


(:action op_4
:parameters (?v12 ?v2)
:precondition (and (pred_2 ?v12) (pred_2 ?v2)
               (pred_3 ?v12) (pred_7 ?v12 ?v2) (pred_10 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v12))))

(:action op_1
:parameters (?v12 ?v13)
:precondition (and (pred_2 ?v12) (pred_5 ?v13) 
                  (pred_3 ?v12) (pred_9 ?v13 ?v12) (pred_11 ))
:effect (and (pred_4 ?v13)
   (not (pred_9 ?v13 ?v12)) (not (pred_11 ))))


(:action op_2
:parameters (?v12 ?v4 ?v1)
:precondition (and (pred_2 ?v12) (pred_5 ?v4) (pred_5 ?v1)
                  (pred_3 ?v12) (pred_4 ?v1) (pred_9 ?v4 ?v12))
:effect (and (pred_4 ?v4) (pred_9 ?v1 ?v12)
        (not (pred_4 ?v1)) (not (pred_9 ?v4 ?v12))))

(:action op_3
:parameters (?v12 ?v13)
:precondition (and (pred_2 ?v12) (pred_5 ?v13) 
                  (pred_3 ?v12) (pred_4 ?v13))
:effect (and (pred_11 ) (pred_9 ?v13 ?v12) (not (pred_4 ?v13)))))


	
