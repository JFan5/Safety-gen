(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v8 ?v12)
             (pred_12 ?v6 ?v10)
             (pred_1 ?v8 ?v10)
             (pred_4 ?v4 ?v8 )
	     (pred_2 ?v8)
             (pred_10 ?v11)
             (pred_3 ?v6)
             (pred_8 ?v10)
             (pred_6 ?v8)
             (pred_9 ?v6)
             (pred_5 ?v8)
             (pred_7 ))



(:action op_3
:parameters (?v3 ?v13 ?v1 ?v5)
:precondition (and (pred_10 ?v3) (pred_10 ?v13) (pred_3 ?v1) (pred_8 ?v5)
          (pred_11 ?v3 ?v13) (pred_12 ?v1 ?v5)
                   (pred_1 ?v13 ?v5) (pred_2 ?v3) 
                   (pred_6 ?v13) (pred_9 ?v1))
:effect (and  (pred_5 ?v13) (not (pred_6 ?v13))))


(:action op_1
:parameters (?v3 ?v9)
:precondition (and (pred_10 ?v3) (pred_10 ?v9)
               (pred_2 ?v3) (pred_11 ?v3 ?v9) (pred_5 ?v9))
:effect (and (pred_2 ?v9) (not (pred_2 ?v3))))

(:action op_4
:parameters (?v3 ?v1)
:precondition (and (pred_10 ?v3) (pred_3 ?v1) 
                  (pred_2 ?v3) (pred_4 ?v1 ?v3) (pred_7 ))
:effect (and (pred_9 ?v1)
   (not (pred_4 ?v1 ?v3)) (not (pred_7 ))))


(:action op_5
:parameters (?v3 ?v2 ?v7)
:precondition (and (pred_10 ?v3) (pred_3 ?v2) (pred_3 ?v7)
                  (pred_2 ?v3) (pred_9 ?v7) (pred_4 ?v2 ?v3))
:effect (and (pred_9 ?v2) (pred_4 ?v7 ?v3)
        (not (pred_9 ?v7)) (not (pred_4 ?v2 ?v3))))

(:action op_2
:parameters (?v3 ?v1)
:precondition (and (pred_10 ?v3) (pred_3 ?v1) 
                  (pred_2 ?v3) (pred_9 ?v1))
:effect (and (pred_7 ) (pred_4 ?v1 ?v3) (not (pred_9 ?v1)))))


	
