(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v4)
             (pred_6 ?v10 ?v1)
             (pred_4 ?v11 ?v1)
             (pred_10 ?v9 ?v11 )
	     (pred_3 ?v11)
             (pred_5 ?v12)
             (pred_2 ?v10)
             (pred_9 ?v1)
             (pred_1 ?v11)
             (pred_11 ?v10)
             (pred_12 ?v11)
             (pred_8 ))



(:action op_5
:parameters (?v8 ?v7 ?v6 ?v2)
:precondition (and (pred_5 ?v8) (pred_5 ?v7) (pred_2 ?v6) (pred_9 ?v2)
          (pred_7 ?v8 ?v7) (pred_6 ?v6 ?v2)
                   (pred_4 ?v7 ?v2) (pred_3 ?v8) 
                   (pred_1 ?v7) (pred_11 ?v6))
:effect (and  (pred_12 ?v7) (not (pred_1 ?v7))))


(:action op_3
:parameters (?v8 ?v5)
:precondition (and (pred_5 ?v8) (pred_5 ?v5)
               (pred_3 ?v8) (pred_7 ?v8 ?v5) (pred_12 ?v5))
:effect (and (pred_3 ?v5) (not (pred_3 ?v8))))

(:action op_4
:parameters (?v8 ?v6)
:precondition (and (pred_5 ?v8) (pred_2 ?v6) 
                  (pred_3 ?v8) (pred_10 ?v6 ?v8) (pred_8 ))
:effect (and (pred_11 ?v6)
   (not (pred_10 ?v6 ?v8)) (not (pred_8 ))))


(:action op_2
:parameters (?v8 ?v13 ?v3)
:precondition (and (pred_5 ?v8) (pred_2 ?v13) (pred_2 ?v3)
                  (pred_3 ?v8) (pred_11 ?v3) (pred_10 ?v13 ?v8))
:effect (and (pred_11 ?v13) (pred_10 ?v3 ?v8)
        (not (pred_11 ?v3)) (not (pred_10 ?v13 ?v8))))

(:action op_1
:parameters (?v8 ?v6)
:precondition (and (pred_5 ?v8) (pred_2 ?v6) 
                  (pred_3 ?v8) (pred_11 ?v6))
:effect (and (pred_8 ) (pred_10 ?v6 ?v8) (not (pred_11 ?v6)))))


	
