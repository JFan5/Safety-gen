; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2140323417 --problem-name spanner-s3-n2-l4-s2140323417
(define (problem spanner-s3-n2-l4-s2140323417)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_10 obj_07 obj_12 - type_2
     obj_01 obj_06 - type_4
     obj_08 obj_11 obj_04 obj_02 - type_3
     obj_09 obj_05 - type_3
    )
 (:init 
    (pred_4 obj_03 obj_09)
    (pred_4 obj_10 obj_11)
    (pred_1 obj_10)
    (pred_4 obj_07 obj_11)
    (pred_1 obj_07)
    (pred_4 obj_12 obj_04)
    (pred_1 obj_12)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_05)
    (pred_6 obj_06)
    (pred_4 obj_06 obj_05)
    (pred_3 obj_09 obj_08)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_08 obj_11)
    (pred_3 obj_11 obj_04)
    (pred_3 obj_04 obj_02)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_09)))
  )
)
)
