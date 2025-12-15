(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v10)
             (pred_9 ?v4 ?v5)
             (pred_4 ?v6 ?v5)
             (pred_10 ?v13 ?v6 )
	     (pred_6 ?v6)
             (pred_2 ?v9)
             (pred_5 ?v4)
             (pred_8 ?v5)
             (pred_12 ?v6)
             (pred_3 ?v4)
             (pred_11 ?v6)
             (pred_1 ))



(:action op_3
:parameters (?v8 ?v7 ?v3 ?v11)
:precondition (and (pred_2 ?v8) (pred_2 ?v7) (pred_5 ?v3) (pred_8 ?v11)
          (pred_7 ?v8 ?v7) (pred_9 ?v3 ?v11)
                   (pred_4 ?v7 ?v11) (pred_6 ?v8) 
                   (pred_12 ?v7) (pred_3 ?v3))
:effect (and  (pred_11 ?v7) (not (pred_12 ?v7))))


(:action op_2
:parameters (?v8 ?v1)
:precondition (and (pred_2 ?v8) (pred_2 ?v1)
               (pred_6 ?v8) (pred_7 ?v8 ?v1) (pred_11 ?v1))
:effect (and (pred_6 ?v1) (not (pred_6 ?v8))))

(:action op_4
:parameters (?v8 ?v3)
:precondition (and (pred_2 ?v8) (pred_5 ?v3) 
                  (pred_6 ?v8) (pred_10 ?v3 ?v8) (pred_1 ))
:effect (and (pred_3 ?v3)
   (not (pred_10 ?v3 ?v8)) (not (pred_1 ))))


(:action op_1
:parameters (?v8 ?v12 ?v2)
:precondition (and (pred_2 ?v8) (pred_5 ?v12) (pred_5 ?v2)
                  (pred_6 ?v8) (pred_3 ?v2) (pred_10 ?v12 ?v8))
:effect (and (pred_3 ?v12) (pred_10 ?v2 ?v8)
        (not (pred_3 ?v2)) (not (pred_10 ?v12 ?v8))))

(:action op_5
:parameters (?v8 ?v3)
:precondition (and (pred_2 ?v8) (pred_5 ?v3) 
                  (pred_6 ?v8) (pred_3 ?v3))
:effect (and (pred_1 ) (pred_10 ?v3 ?v8) (not (pred_3 ?v3)))))


	
