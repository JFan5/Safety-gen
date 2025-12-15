(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v9 ?v12)
             (pred_4 ?v8 ?v10)
             (pred_7 ?v9 ?v10)
             (pred_1 ?v3 ?v9 )
	     (pred_2 ?v9)
             (pred_11 ?v5)
             (pred_3 ?v8)
             (pred_8 ?v10)
             (pred_12 ?v9)
             (pred_10 ?v8)
             (pred_5 ?v9)
             (pred_9 ))



(:action op_5
:parameters (?v7 ?v1 ?v6 ?v4)
:precondition (and (pred_11 ?v7) (pred_11 ?v1) (pred_3 ?v6) (pred_8 ?v4)
          (pred_6 ?v7 ?v1) (pred_4 ?v6 ?v4)
                   (pred_7 ?v1 ?v4) (pred_2 ?v7) 
                   (pred_12 ?v1) (pred_10 ?v6))
:effect (and  (pred_5 ?v1) (not (pred_12 ?v1))))


(:action op_3
:parameters (?v7 ?v2)
:precondition (and (pred_11 ?v7) (pred_11 ?v2)
               (pred_2 ?v7) (pred_6 ?v7 ?v2) (pred_5 ?v2))
:effect (and (pred_2 ?v2) (not (pred_2 ?v7))))

(:action op_4
:parameters (?v7 ?v6)
:precondition (and (pred_11 ?v7) (pred_3 ?v6) 
                  (pred_2 ?v7) (pred_1 ?v6 ?v7) (pred_9 ))
:effect (and (pred_10 ?v6)
   (not (pred_1 ?v6 ?v7)) (not (pred_9 ))))


(:action op_1
:parameters (?v7 ?v13 ?v11)
:precondition (and (pred_11 ?v7) (pred_3 ?v13) (pred_3 ?v11)
                  (pred_2 ?v7) (pred_10 ?v11) (pred_1 ?v13 ?v7))
:effect (and (pred_10 ?v13) (pred_1 ?v11 ?v7)
        (not (pred_10 ?v11)) (not (pred_1 ?v13 ?v7))))

(:action op_2
:parameters (?v7 ?v6)
:precondition (and (pred_11 ?v7) (pred_3 ?v6) 
                  (pred_2 ?v7) (pred_10 ?v6))
:effect (and (pred_9 ) (pred_1 ?v6 ?v7) (not (pred_10 ?v6)))))


	
