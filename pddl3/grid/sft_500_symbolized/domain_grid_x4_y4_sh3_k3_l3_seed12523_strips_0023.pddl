(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v8 ?v6)
             (pred_9 ?v12 ?v11)
             (pred_3 ?v8 ?v11)
             (pred_2 ?v2 ?v8 )
	     (pred_6 ?v8)
             (pred_4 ?v13)
             (pred_11 ?v12)
             (pred_5 ?v11)
             (pred_10 ?v8)
             (pred_12 ?v12)
             (pred_1 ?v8)
             (pred_7 ))



(:action op_3
:parameters (?v3 ?v7 ?v10 ?v1)
:precondition (and (pred_4 ?v3) (pred_4 ?v7) (pred_11 ?v10) (pred_5 ?v1)
          (pred_8 ?v3 ?v7) (pred_9 ?v10 ?v1)
                   (pred_3 ?v7 ?v1) (pred_6 ?v3) 
                   (pred_10 ?v7) (pred_12 ?v10))
:effect (and  (pred_1 ?v7) (not (pred_10 ?v7))))


(:action op_1
:parameters (?v3 ?v4)
:precondition (and (pred_4 ?v3) (pred_4 ?v4)
               (pred_6 ?v3) (pred_8 ?v3 ?v4) (pred_1 ?v4))
:effect (and (pred_6 ?v4) (not (pred_6 ?v3))))

(:action op_4
:parameters (?v3 ?v10)
:precondition (and (pred_4 ?v3) (pred_11 ?v10) 
                  (pred_6 ?v3) (pred_2 ?v10 ?v3) (pred_7 ))
:effect (and (pred_12 ?v10)
   (not (pred_2 ?v10 ?v3)) (not (pred_7 ))))


(:action op_5
:parameters (?v3 ?v5 ?v9)
:precondition (and (pred_4 ?v3) (pred_11 ?v5) (pred_11 ?v9)
                  (pred_6 ?v3) (pred_12 ?v9) (pred_2 ?v5 ?v3))
:effect (and (pred_12 ?v5) (pred_2 ?v9 ?v3)
        (not (pred_12 ?v9)) (not (pred_2 ?v5 ?v3))))

(:action op_2
:parameters (?v3 ?v10)
:precondition (and (pred_4 ?v3) (pred_11 ?v10) 
                  (pred_6 ?v3) (pred_12 ?v10))
:effect (and (pred_7 ) (pred_2 ?v10 ?v3) (not (pred_12 ?v10)))))


	
