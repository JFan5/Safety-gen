(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v1 ?v2)
             (pred_3 ?v11 ?v12)
             (pred_9 ?v1 ?v12)
             (pred_5 ?v5 ?v1 )
	     (pred_4 ?v1)
             (pred_1 ?v10)
             (pred_6 ?v11)
             (pred_11 ?v12)
             (pred_10 ?v1)
             (pred_2 ?v11)
             (pred_12 ?v1)
             (pred_7 ))



(:action op_5
:parameters (?v3 ?v13 ?v7 ?v9)
:precondition (and (pred_1 ?v3) (pred_1 ?v13) (pred_6 ?v7) (pred_11 ?v9)
          (pred_8 ?v3 ?v13) (pred_3 ?v7 ?v9)
                   (pred_9 ?v13 ?v9) (pred_4 ?v3) 
                   (pred_10 ?v13) (pred_2 ?v7))
:effect (and  (pred_12 ?v13) (not (pred_10 ?v13))))


(:action op_1
:parameters (?v3 ?v6)
:precondition (and (pred_1 ?v3) (pred_1 ?v6)
               (pred_4 ?v3) (pred_8 ?v3 ?v6) (pred_12 ?v6))
:effect (and (pred_4 ?v6) (not (pred_4 ?v3))))

(:action op_3
:parameters (?v3 ?v7)
:precondition (and (pred_1 ?v3) (pred_6 ?v7) 
                  (pred_4 ?v3) (pred_5 ?v7 ?v3) (pred_7 ))
:effect (and (pred_2 ?v7)
   (not (pred_5 ?v7 ?v3)) (not (pred_7 ))))


(:action op_4
:parameters (?v3 ?v4 ?v8)
:precondition (and (pred_1 ?v3) (pred_6 ?v4) (pred_6 ?v8)
                  (pred_4 ?v3) (pred_2 ?v8) (pred_5 ?v4 ?v3))
:effect (and (pred_2 ?v4) (pred_5 ?v8 ?v3)
        (not (pred_2 ?v8)) (not (pred_5 ?v4 ?v3))))

(:action op_2
:parameters (?v3 ?v7)
:precondition (and (pred_1 ?v3) (pred_6 ?v7) 
                  (pred_4 ?v3) (pred_2 ?v7))
:effect (and (pred_7 ) (pred_5 ?v7 ?v3) (not (pred_2 ?v7)))))


	
