(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v4)
             (pred_8 ?v8 ?v10)
             (pred_1 ?v11 ?v10)
             (pred_6 ?v2 ?v11 )
	     (pred_5 ?v11)
             (pred_11 ?v6)
             (pred_9 ?v8)
             (pred_3 ?v10)
             (pred_2 ?v11)
             (pred_7 ?v8)
             (pred_4 ?v11)
             (pred_12 ))



(:action op_2
:parameters (?v3 ?v13 ?v7 ?v1)
:precondition (and (pred_11 ?v3) (pred_11 ?v13) (pred_9 ?v7) (pred_3 ?v1)
          (pred_10 ?v3 ?v13) (pred_8 ?v7 ?v1)
                   (pred_1 ?v13 ?v1) (pred_5 ?v3) 
                   (pred_2 ?v13) (pred_7 ?v7))
:effect (and  (pred_4 ?v13) (not (pred_2 ?v13))))


(:action op_5
:parameters (?v3 ?v12)
:precondition (and (pred_11 ?v3) (pred_11 ?v12)
               (pred_5 ?v3) (pred_10 ?v3 ?v12) (pred_4 ?v12))
:effect (and (pred_5 ?v12) (not (pred_5 ?v3))))

(:action op_1
:parameters (?v3 ?v7)
:precondition (and (pred_11 ?v3) (pred_9 ?v7) 
                  (pred_5 ?v3) (pred_6 ?v7 ?v3) (pred_12 ))
:effect (and (pred_7 ?v7)
   (not (pred_6 ?v7 ?v3)) (not (pred_12 ))))


(:action op_3
:parameters (?v3 ?v9 ?v5)
:precondition (and (pred_11 ?v3) (pred_9 ?v9) (pred_9 ?v5)
                  (pred_5 ?v3) (pred_7 ?v5) (pred_6 ?v9 ?v3))
:effect (and (pred_7 ?v9) (pred_6 ?v5 ?v3)
        (not (pred_7 ?v5)) (not (pred_6 ?v9 ?v3))))

(:action op_4
:parameters (?v3 ?v7)
:precondition (and (pred_11 ?v3) (pred_9 ?v7) 
                  (pred_5 ?v3) (pred_7 ?v7))
:effect (and (pred_12 ) (pred_6 ?v7 ?v3) (not (pred_7 ?v7)))))


	
