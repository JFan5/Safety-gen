(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v2 ?v9)
             (pred_4 ?v11 ?v5)
             (pred_6 ?v2 ?v5)
             (pred_9 ?v3 ?v2 )
	     (pred_5 ?v2)
             (pred_10 ?v1)
             (pred_3 ?v11)
             (pred_8 ?v5)
             (pred_2 ?v2)
             (pred_1 ?v11)
             (pred_7 ?v2)
             (pred_11 ))



(:action op_1
:parameters (?v7 ?v6 ?v8 ?v13)
:precondition (and (pred_10 ?v7) (pred_10 ?v6) (pred_3 ?v8) (pred_8 ?v13)
          (pred_12 ?v7 ?v6) (pred_4 ?v8 ?v13)
                   (pred_6 ?v6 ?v13) (pred_5 ?v7) 
                   (pred_2 ?v6) (pred_1 ?v8))
:effect (and  (pred_7 ?v6) (not (pred_2 ?v6))))


(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_10 ?v7) (pred_10 ?v4)
               (pred_5 ?v7) (pred_12 ?v7 ?v4) (pred_7 ?v4))
:effect (and (pred_5 ?v4) (not (pred_5 ?v7))))

(:action op_2
:parameters (?v7 ?v8)
:precondition (and (pred_10 ?v7) (pred_3 ?v8) 
                  (pred_5 ?v7) (pred_9 ?v8 ?v7) (pred_11 ))
:effect (and (pred_1 ?v8)
   (not (pred_9 ?v8 ?v7)) (not (pred_11 ))))


(:action op_3
:parameters (?v7 ?v12 ?v10)
:precondition (and (pred_10 ?v7) (pred_3 ?v12) (pred_3 ?v10)
                  (pred_5 ?v7) (pred_1 ?v10) (pred_9 ?v12 ?v7))
:effect (and (pred_1 ?v12) (pred_9 ?v10 ?v7)
        (not (pred_1 ?v10)) (not (pred_9 ?v12 ?v7))))

(:action op_5
:parameters (?v7 ?v8)
:precondition (and (pred_10 ?v7) (pred_3 ?v8) 
                  (pred_5 ?v7) (pred_1 ?v8))
:effect (and (pred_11 ) (pred_9 ?v8 ?v7) (not (pred_1 ?v8)))))


	
