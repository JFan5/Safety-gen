(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v8 ?v9)
             (pred_10 ?v4 ?v10)
             (pred_5 ?v8 ?v10)
             (pred_8 ?v11 ?v8 )
	     (pred_12 ?v8)
             (pred_1 ?v5)
             (pred_3 ?v4)
             (pred_6 ?v10)
             (pred_7 ?v8)
             (pred_4 ?v4)
             (pred_2 ?v8)
             (pred_9 ))



(:action op_4
:parameters (?v7 ?v13 ?v6 ?v12)
:precondition (and (pred_1 ?v7) (pred_1 ?v13) (pred_3 ?v6) (pred_6 ?v12)
          (pred_11 ?v7 ?v13) (pred_10 ?v6 ?v12)
                   (pred_5 ?v13 ?v12) (pred_12 ?v7) 
                   (pred_7 ?v13) (pred_4 ?v6))
:effect (and  (pred_2 ?v13) (not (pred_7 ?v13))))


(:action op_5
:parameters (?v7 ?v2)
:precondition (and (pred_1 ?v7) (pred_1 ?v2)
               (pred_12 ?v7) (pred_11 ?v7 ?v2) (pred_2 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v7))))

(:action op_3
:parameters (?v7 ?v6)
:precondition (and (pred_1 ?v7) (pred_3 ?v6) 
                  (pred_12 ?v7) (pred_8 ?v6 ?v7) (pred_9 ))
:effect (and (pred_4 ?v6)
   (not (pred_8 ?v6 ?v7)) (not (pred_9 ))))


(:action op_2
:parameters (?v7 ?v3 ?v1)
:precondition (and (pred_1 ?v7) (pred_3 ?v3) (pred_3 ?v1)
                  (pred_12 ?v7) (pred_4 ?v1) (pred_8 ?v3 ?v7))
:effect (and (pred_4 ?v3) (pred_8 ?v1 ?v7)
        (not (pred_4 ?v1)) (not (pred_8 ?v3 ?v7))))

(:action op_1
:parameters (?v7 ?v6)
:precondition (and (pred_1 ?v7) (pred_3 ?v6) 
                  (pred_12 ?v7) (pred_4 ?v6))
:effect (and (pred_9 ) (pred_8 ?v6 ?v7) (not (pred_4 ?v6)))))


	
