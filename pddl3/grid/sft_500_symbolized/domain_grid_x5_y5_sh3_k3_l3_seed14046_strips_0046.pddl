(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v9 ?v10)
             (pred_12 ?v11 ?v8)
             (pred_4 ?v9 ?v8)
             (pred_9 ?v1 ?v9 )
	     (pred_7 ?v9)
             (pred_8 ?v6)
             (pred_10 ?v11)
             (pred_11 ?v8)
             (pred_5 ?v9)
             (pred_2 ?v11)
             (pred_6 ?v9)
             (pred_1 ))



(:action op_3
:parameters (?v7 ?v3 ?v5 ?v2)
:precondition (and (pred_8 ?v7) (pred_8 ?v3) (pred_10 ?v5) (pred_11 ?v2)
          (pred_3 ?v7 ?v3) (pred_12 ?v5 ?v2)
                   (pred_4 ?v3 ?v2) (pred_7 ?v7) 
                   (pred_5 ?v3) (pred_2 ?v5))
:effect (and  (pred_6 ?v3) (not (pred_5 ?v3))))


(:action op_1
:parameters (?v7 ?v12)
:precondition (and (pred_8 ?v7) (pred_8 ?v12)
               (pred_7 ?v7) (pred_3 ?v7 ?v12) (pred_6 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v7))))

(:action op_5
:parameters (?v7 ?v5)
:precondition (and (pred_8 ?v7) (pred_10 ?v5) 
                  (pred_7 ?v7) (pred_9 ?v5 ?v7) (pred_1 ))
:effect (and (pred_2 ?v5)
   (not (pred_9 ?v5 ?v7)) (not (pred_1 ))))


(:action op_2
:parameters (?v7 ?v4 ?v13)
:precondition (and (pred_8 ?v7) (pred_10 ?v4) (pred_10 ?v13)
                  (pred_7 ?v7) (pred_2 ?v13) (pred_9 ?v4 ?v7))
:effect (and (pred_2 ?v4) (pred_9 ?v13 ?v7)
        (not (pred_2 ?v13)) (not (pred_9 ?v4 ?v7))))

(:action op_4
:parameters (?v7 ?v5)
:precondition (and (pred_8 ?v7) (pred_10 ?v5) 
                  (pred_7 ?v7) (pred_2 ?v5))
:effect (and (pred_1 ) (pred_9 ?v5 ?v7) (not (pred_2 ?v5)))))


	
