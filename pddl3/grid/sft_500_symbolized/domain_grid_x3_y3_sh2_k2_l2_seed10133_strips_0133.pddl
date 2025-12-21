(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v12 ?v9)
             (pred_4 ?v10 ?v1)
             (pred_7 ?v12 ?v1)
             (pred_9 ?v3 ?v12 )
	     (pred_10 ?v12)
             (pred_5 ?v8)
             (pred_8 ?v10)
             (pred_6 ?v1)
             (pred_3 ?v12)
             (pred_1 ?v10)
             (pred_2 ?v12)
             (pred_12 ))



(:action op_5
:parameters (?v7 ?v13 ?v4 ?v11)
:precondition (and (pred_5 ?v7) (pred_5 ?v13) (pred_8 ?v4) (pred_6 ?v11)
          (pred_11 ?v7 ?v13) (pred_4 ?v4 ?v11)
                   (pred_7 ?v13 ?v11) (pred_10 ?v7) 
                   (pred_3 ?v13) (pred_1 ?v4))
:effect (and  (pred_2 ?v13) (not (pred_3 ?v13))))


(:action op_3
:parameters (?v7 ?v2)
:precondition (and (pred_5 ?v7) (pred_5 ?v2)
               (pred_10 ?v7) (pred_11 ?v7 ?v2) (pred_2 ?v2))
:effect (and (pred_10 ?v2) (not (pred_10 ?v7))))

(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_5 ?v7) (pred_8 ?v4) 
                  (pred_10 ?v7) (pred_9 ?v4 ?v7) (pred_12 ))
:effect (and (pred_1 ?v4)
   (not (pred_9 ?v4 ?v7)) (not (pred_12 ))))


(:action op_1
:parameters (?v7 ?v6 ?v5)
:precondition (and (pred_5 ?v7) (pred_8 ?v6) (pred_8 ?v5)
                  (pred_10 ?v7) (pred_1 ?v5) (pred_9 ?v6 ?v7))
:effect (and (pred_1 ?v6) (pred_9 ?v5 ?v7)
        (not (pred_1 ?v5)) (not (pred_9 ?v6 ?v7))))

(:action op_2
:parameters (?v7 ?v4)
:precondition (and (pred_5 ?v7) (pred_8 ?v4) 
                  (pred_10 ?v7) (pred_1 ?v4))
:effect (and (pred_12 ) (pred_9 ?v4 ?v7) (not (pred_1 ?v4)))))


	
