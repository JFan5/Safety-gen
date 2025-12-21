(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v8 ?v3)
             (pred_6 ?v5 ?v9)
             (pred_7 ?v8 ?v9)
             (pred_9 ?v2 ?v8 )
	     (pred_8 ?v8)
             (pred_12 ?v1)
             (pred_5 ?v5)
             (pred_3 ?v9)
             (pred_1 ?v8)
             (pred_11 ?v5)
             (pred_4 ?v8)
             (pred_10 ))



(:action op_4
:parameters (?v7 ?v6 ?v13 ?v12)
:precondition (and (pred_12 ?v7) (pred_12 ?v6) (pred_5 ?v13) (pred_3 ?v12)
          (pred_2 ?v7 ?v6) (pred_6 ?v13 ?v12)
                   (pred_7 ?v6 ?v12) (pred_8 ?v7) 
                   (pred_1 ?v6) (pred_11 ?v13))
:effect (and  (pred_4 ?v6) (not (pred_1 ?v6))))


(:action op_1
:parameters (?v7 ?v11)
:precondition (and (pred_12 ?v7) (pred_12 ?v11)
               (pred_8 ?v7) (pred_2 ?v7 ?v11) (pred_4 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v7))))

(:action op_5
:parameters (?v7 ?v13)
:precondition (and (pred_12 ?v7) (pred_5 ?v13) 
                  (pred_8 ?v7) (pred_9 ?v13 ?v7) (pred_10 ))
:effect (and (pred_11 ?v13)
   (not (pred_9 ?v13 ?v7)) (not (pred_10 ))))


(:action op_3
:parameters (?v7 ?v4 ?v10)
:precondition (and (pred_12 ?v7) (pred_5 ?v4) (pred_5 ?v10)
                  (pred_8 ?v7) (pred_11 ?v10) (pred_9 ?v4 ?v7))
:effect (and (pred_11 ?v4) (pred_9 ?v10 ?v7)
        (not (pred_11 ?v10)) (not (pred_9 ?v4 ?v7))))

(:action op_2
:parameters (?v7 ?v13)
:precondition (and (pred_12 ?v7) (pred_5 ?v13) 
                  (pred_8 ?v7) (pred_11 ?v13))
:effect (and (pred_10 ) (pred_9 ?v13 ?v7) (not (pred_11 ?v13)))))


	
