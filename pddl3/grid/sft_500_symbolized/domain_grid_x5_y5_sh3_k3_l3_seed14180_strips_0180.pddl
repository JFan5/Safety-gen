(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v10 ?v12)
             (pred_1 ?v5 ?v9)
             (pred_11 ?v10 ?v9)
             (pred_3 ?v6 ?v10 )
	     (pred_12 ?v10)
             (pred_6 ?v4)
             (pred_4 ?v5)
             (pred_10 ?v9)
             (pred_2 ?v10)
             (pred_8 ?v5)
             (pred_7 ?v10)
             (pred_5 ))



(:action op_4
:parameters (?v3 ?v13 ?v11 ?v2)
:precondition (and (pred_6 ?v3) (pred_6 ?v13) (pred_4 ?v11) (pred_10 ?v2)
          (pred_9 ?v3 ?v13) (pred_1 ?v11 ?v2)
                   (pred_11 ?v13 ?v2) (pred_12 ?v3) 
                   (pred_2 ?v13) (pred_8 ?v11))
:effect (and  (pred_7 ?v13) (not (pred_2 ?v13))))


(:action op_2
:parameters (?v3 ?v7)
:precondition (and (pred_6 ?v3) (pred_6 ?v7)
               (pred_12 ?v3) (pred_9 ?v3 ?v7) (pred_7 ?v7))
:effect (and (pred_12 ?v7) (not (pred_12 ?v3))))

(:action op_3
:parameters (?v3 ?v11)
:precondition (and (pred_6 ?v3) (pred_4 ?v11) 
                  (pred_12 ?v3) (pred_3 ?v11 ?v3) (pred_5 ))
:effect (and (pred_8 ?v11)
   (not (pred_3 ?v11 ?v3)) (not (pred_5 ))))


(:action op_5
:parameters (?v3 ?v8 ?v1)
:precondition (and (pred_6 ?v3) (pred_4 ?v8) (pred_4 ?v1)
                  (pred_12 ?v3) (pred_8 ?v1) (pred_3 ?v8 ?v3))
:effect (and (pred_8 ?v8) (pred_3 ?v1 ?v3)
        (not (pred_8 ?v1)) (not (pred_3 ?v8 ?v3))))

(:action op_1
:parameters (?v3 ?v11)
:precondition (and (pred_6 ?v3) (pred_4 ?v11) 
                  (pred_12 ?v3) (pred_8 ?v11))
:effect (and (pred_5 ) (pred_3 ?v11 ?v3) (not (pred_8 ?v11)))))


	
