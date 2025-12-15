(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v10)
             (pred_12 ?v11 ?v12)
             (pred_10 ?v5 ?v12)
             (pred_1 ?v4 ?v5 )
	     (pred_5 ?v5)
             (pred_2 ?v13)
             (pred_8 ?v11)
             (pred_3 ?v12)
             (pred_7 ?v5)
             (pred_6 ?v11)
             (pred_9 ?v5)
             (pred_4 ))



(:action op_4
:parameters (?v7 ?v6 ?v8 ?v3)
:precondition (and (pred_2 ?v7) (pred_2 ?v6) (pred_8 ?v8) (pred_3 ?v3)
          (pred_11 ?v7 ?v6) (pred_12 ?v8 ?v3)
                   (pred_10 ?v6 ?v3) (pred_5 ?v7) 
                   (pred_7 ?v6) (pred_6 ?v8))
:effect (and  (pred_9 ?v6) (not (pred_7 ?v6))))


(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_2 ?v7) (pred_2 ?v1)
               (pred_5 ?v7) (pred_11 ?v7 ?v1) (pred_9 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v7))))

(:action op_5
:parameters (?v7 ?v8)
:precondition (and (pred_2 ?v7) (pred_8 ?v8) 
                  (pred_5 ?v7) (pred_1 ?v8 ?v7) (pred_4 ))
:effect (and (pred_6 ?v8)
   (not (pred_1 ?v8 ?v7)) (not (pred_4 ))))


(:action op_1
:parameters (?v7 ?v2 ?v9)
:precondition (and (pred_2 ?v7) (pred_8 ?v2) (pred_8 ?v9)
                  (pred_5 ?v7) (pred_6 ?v9) (pred_1 ?v2 ?v7))
:effect (and (pred_6 ?v2) (pred_1 ?v9 ?v7)
        (not (pred_6 ?v9)) (not (pred_1 ?v2 ?v7))))

(:action op_3
:parameters (?v7 ?v8)
:precondition (and (pred_2 ?v7) (pred_8 ?v8) 
                  (pred_5 ?v7) (pred_6 ?v8))
:effect (and (pred_4 ) (pred_1 ?v8 ?v7) (not (pred_6 ?v8)))))


	
