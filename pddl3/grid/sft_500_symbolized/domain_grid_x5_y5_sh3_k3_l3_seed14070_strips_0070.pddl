(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v12 ?v13)
             (pred_7 ?v4 ?v11)
             (pred_10 ?v12 ?v11)
             (pred_4 ?v2 ?v12 )
	     (pred_11 ?v12)
             (pred_8 ?v8)
             (pred_3 ?v4)
             (pred_9 ?v11)
             (pred_1 ?v12)
             (pred_12 ?v4)
             (pred_2 ?v12)
             (pred_5 ))



(:action op_4
:parameters (?v3 ?v6 ?v7 ?v10)
:precondition (and (pred_8 ?v3) (pred_8 ?v6) (pred_3 ?v7) (pred_9 ?v10)
          (pred_6 ?v3 ?v6) (pred_7 ?v7 ?v10)
                   (pred_10 ?v6 ?v10) (pred_11 ?v3) 
                   (pred_1 ?v6) (pred_12 ?v7))
:effect (and  (pred_2 ?v6) (not (pred_1 ?v6))))


(:action op_3
:parameters (?v3 ?v1)
:precondition (and (pred_8 ?v3) (pred_8 ?v1)
               (pred_11 ?v3) (pred_6 ?v3 ?v1) (pred_2 ?v1))
:effect (and (pred_11 ?v1) (not (pred_11 ?v3))))

(:action op_2
:parameters (?v3 ?v7)
:precondition (and (pred_8 ?v3) (pred_3 ?v7) 
                  (pred_11 ?v3) (pred_4 ?v7 ?v3) (pred_5 ))
:effect (and (pred_12 ?v7)
   (not (pred_4 ?v7 ?v3)) (not (pred_5 ))))


(:action op_1
:parameters (?v3 ?v9 ?v5)
:precondition (and (pred_8 ?v3) (pred_3 ?v9) (pred_3 ?v5)
                  (pred_11 ?v3) (pred_12 ?v5) (pred_4 ?v9 ?v3))
:effect (and (pred_12 ?v9) (pred_4 ?v5 ?v3)
        (not (pred_12 ?v5)) (not (pred_4 ?v9 ?v3))))

(:action op_5
:parameters (?v3 ?v7)
:precondition (and (pred_8 ?v3) (pred_3 ?v7) 
                  (pred_11 ?v3) (pred_12 ?v7))
:effect (and (pred_5 ) (pred_4 ?v7 ?v3) (not (pred_12 ?v7)))))


	
