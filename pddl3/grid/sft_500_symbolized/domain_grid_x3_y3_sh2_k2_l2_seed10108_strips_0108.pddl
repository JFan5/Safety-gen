(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v5 ?v2)
             (pred_3 ?v10 ?v3)
             (pred_8 ?v5 ?v3)
             (pred_4 ?v11 ?v5 )
	     (pred_11 ?v5)
             (pred_10 ?v4)
             (pred_5 ?v10)
             (pred_9 ?v3)
             (pred_2 ?v5)
             (pred_1 ?v10)
             (pred_6 ?v5)
             (pred_7 ))



(:action op_3
:parameters (?v7 ?v13 ?v8 ?v6)
:precondition (and (pred_10 ?v7) (pred_10 ?v13) (pred_5 ?v8) (pred_9 ?v6)
          (pred_12 ?v7 ?v13) (pred_3 ?v8 ?v6)
                   (pred_8 ?v13 ?v6) (pred_11 ?v7) 
                   (pred_2 ?v13) (pred_1 ?v8))
:effect (and  (pred_6 ?v13) (not (pred_2 ?v13))))


(:action op_2
:parameters (?v7 ?v12)
:precondition (and (pred_10 ?v7) (pred_10 ?v12)
               (pred_11 ?v7) (pred_12 ?v7 ?v12) (pred_6 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v7))))

(:action op_5
:parameters (?v7 ?v8)
:precondition (and (pred_10 ?v7) (pred_5 ?v8) 
                  (pred_11 ?v7) (pred_4 ?v8 ?v7) (pred_7 ))
:effect (and (pred_1 ?v8)
   (not (pred_4 ?v8 ?v7)) (not (pred_7 ))))


(:action op_1
:parameters (?v7 ?v9 ?v1)
:precondition (and (pred_10 ?v7) (pred_5 ?v9) (pred_5 ?v1)
                  (pred_11 ?v7) (pred_1 ?v1) (pred_4 ?v9 ?v7))
:effect (and (pred_1 ?v9) (pred_4 ?v1 ?v7)
        (not (pred_1 ?v1)) (not (pred_4 ?v9 ?v7))))

(:action op_4
:parameters (?v7 ?v8)
:precondition (and (pred_10 ?v7) (pred_5 ?v8) 
                  (pred_11 ?v7) (pred_1 ?v8))
:effect (and (pred_7 ) (pred_4 ?v8 ?v7) (not (pred_1 ?v8)))))


	
