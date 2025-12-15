; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 862051498 --problem-name spanner-s3-n2-l4-s862051498
(define (problem spanner-s3-n2-l4-s862051498)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_08 obj_09 obj_12 - type_5
     obj_10 obj_11 - type_1
     obj_06 obj_02 obj_07 obj_01 - type_3
     obj_03 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_04 obj_03)
    (pred_3 obj_08 obj_02)
    (pred_1 obj_08)
    (pred_3 obj_09 obj_06)
    (pred_1 obj_09)
    (pred_3 obj_12 obj_02)
    (pred_1 obj_12)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_05)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_05)
    (pred_4 obj_03 obj_06)
    (pred_4 obj_01 obj_05)
    (pred_4 obj_06 obj_02)
    (pred_4 obj_02 obj_07)
    (pred_4 obj_07 obj_01)
)
 (:goal
  (and
   (pred_2 obj_10)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
