; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 688053435 --problem-name spanner-s2-n2-l3-s688053435
(define (problem spanner-s2-n2-l3-s688053435)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_06 obj_03 - type_1
     obj_04 obj_02 - type_2
     obj_09 obj_07 obj_01 - type_4
     obj_08 obj_05 - type_4
    )
 (:init 
    (pred_2 obj_10 obj_08)
    (pred_2 obj_06 obj_09)
    (pred_4 obj_06)
    (pred_2 obj_03 obj_07)
    (pred_4 obj_03)
    (pred_6 obj_04)
    (pred_2 obj_04 obj_05)
    (pred_6 obj_02)
    (pred_2 obj_02 obj_05)
    (pred_1 obj_08 obj_09)
    (pred_1 obj_01 obj_05)
    (pred_1 obj_09 obj_07)
    (pred_1 obj_07 obj_01)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
