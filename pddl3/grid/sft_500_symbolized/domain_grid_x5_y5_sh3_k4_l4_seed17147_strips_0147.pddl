(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v12 ?v13)
             (pred_5 ?v8 ?v5)
             (pred_11 ?v12 ?v5)
             (pred_4 ?v4 ?v12 )
	     (pred_8 ?v12)
             (pred_3 ?v11)
             (pred_2 ?v8)
             (pred_7 ?v5)
             (pred_9 ?v12)
             (pred_1 ?v8)
             (pred_12 ?v12)
             (pred_6 ))



(:action op_1
:parameters (?v10 ?v7 ?v6 ?v1)
:precondition (and (pred_3 ?v10) (pred_3 ?v7) (pred_2 ?v6) (pred_7 ?v1)
          (pred_10 ?v10 ?v7) (pred_5 ?v6 ?v1)
                   (pred_11 ?v7 ?v1) (pred_8 ?v10) 
                   (pred_9 ?v7) (pred_1 ?v6))
:effect (and  (pred_12 ?v7) (not (pred_9 ?v7))))


(:action op_2
:parameters (?v10 ?v2)
:precondition (and (pred_3 ?v10) (pred_3 ?v2)
               (pred_8 ?v10) (pred_10 ?v10 ?v2) (pred_12 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v10))))

(:action op_5
:parameters (?v10 ?v6)
:precondition (and (pred_3 ?v10) (pred_2 ?v6) 
                  (pred_8 ?v10) (pred_4 ?v6 ?v10) (pred_6 ))
:effect (and (pred_1 ?v6)
   (not (pred_4 ?v6 ?v10)) (not (pred_6 ))))


(:action op_3
:parameters (?v10 ?v3 ?v9)
:precondition (and (pred_3 ?v10) (pred_2 ?v3) (pred_2 ?v9)
                  (pred_8 ?v10) (pred_1 ?v9) (pred_4 ?v3 ?v10))
:effect (and (pred_1 ?v3) (pred_4 ?v9 ?v10)
        (not (pred_1 ?v9)) (not (pred_4 ?v3 ?v10))))

(:action op_4
:parameters (?v10 ?v6)
:precondition (and (pred_3 ?v10) (pred_2 ?v6) 
                  (pred_8 ?v10) (pred_1 ?v6))
:effect (and (pred_6 ) (pred_4 ?v6 ?v10) (not (pred_1 ?v6)))))


	
