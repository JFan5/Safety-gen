(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v3 ?v2)
             (pred_8 ?v4 ?v9)
             (pred_10 ?v3 ?v9)
             (pred_2 ?v11 ?v3 )
	     (pred_6 ?v3)
             (pred_9 ?v10)
             (pred_11 ?v4)
             (pred_4 ?v9)
             (pred_5 ?v3)
             (pred_3 ?v4)
             (pred_12 ?v3)
             (pred_7 ))



(:action op_4
:parameters (?v7 ?v13 ?v12 ?v6)
:precondition (and (pred_9 ?v7) (pred_9 ?v13) (pred_11 ?v12) (pred_4 ?v6)
          (pred_1 ?v7 ?v13) (pred_8 ?v12 ?v6)
                   (pred_10 ?v13 ?v6) (pred_6 ?v7) 
                   (pred_5 ?v13) (pred_3 ?v12))
:effect (and  (pred_12 ?v13) (not (pred_5 ?v13))))


(:action op_1
:parameters (?v7 ?v1)
:precondition (and (pred_9 ?v7) (pred_9 ?v1)
               (pred_6 ?v7) (pred_1 ?v7 ?v1) (pred_12 ?v1))
:effect (and (pred_6 ?v1) (not (pred_6 ?v7))))

(:action op_2
:parameters (?v7 ?v12)
:precondition (and (pred_9 ?v7) (pred_11 ?v12) 
                  (pred_6 ?v7) (pred_2 ?v12 ?v7) (pred_7 ))
:effect (and (pred_3 ?v12)
   (not (pred_2 ?v12 ?v7)) (not (pred_7 ))))


(:action op_3
:parameters (?v7 ?v8 ?v5)
:precondition (and (pred_9 ?v7) (pred_11 ?v8) (pred_11 ?v5)
                  (pred_6 ?v7) (pred_3 ?v5) (pred_2 ?v8 ?v7))
:effect (and (pred_3 ?v8) (pred_2 ?v5 ?v7)
        (not (pred_3 ?v5)) (not (pred_2 ?v8 ?v7))))

(:action op_5
:parameters (?v7 ?v12)
:precondition (and (pred_9 ?v7) (pred_11 ?v12) 
                  (pred_6 ?v7) (pred_3 ?v12))
:effect (and (pred_7 ) (pred_2 ?v12 ?v7) (not (pred_3 ?v12)))))


	
