; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 423179346 --problem-name spanner-s2-n2-l3-s423179346
(define (problem spanner-s2-n2-l3-s423179346)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_02 obj_06 - type_3
     obj_04 obj_10 - type_1
     obj_05 obj_09 obj_07 - type_2
     obj_01 obj_03 - type_2
    )
 (:init 
    (pred_4 obj_08 obj_01)
    (pred_4 obj_02 obj_05)
    (pred_6 obj_02)
    (pred_4 obj_06 obj_07)
    (pred_6 obj_06)
    (pred_1 obj_04)
    (pred_4 obj_04 obj_03)
    (pred_1 obj_10)
    (pred_4 obj_10 obj_03)
    (pred_3 obj_01 obj_05)
    (pred_3 obj_07 obj_03)
    (pred_3 obj_05 obj_09)
    (pred_3 obj_09 obj_07)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
