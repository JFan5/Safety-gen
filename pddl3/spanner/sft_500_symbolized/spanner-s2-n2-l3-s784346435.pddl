; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 784346435 --problem-name spanner-s2-n2-l3-s784346435
(define (problem spanner-s2-n2-l3-s784346435)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_05 obj_03 - type_1
     obj_04 obj_01 - type_4
     obj_09 obj_07 obj_10 - type_2
     obj_02 obj_08 - type_2
    )
 (:init 
    (pred_4 obj_06 obj_02)
    (pred_4 obj_05 obj_10)
    (pred_3 obj_05)
    (pred_4 obj_03 obj_10)
    (pred_3 obj_03)
    (pred_5 obj_04)
    (pred_4 obj_04 obj_08)
    (pred_5 obj_01)
    (pred_4 obj_01 obj_08)
    (pred_2 obj_02 obj_09)
    (pred_2 obj_10 obj_08)
    (pred_2 obj_09 obj_07)
    (pred_2 obj_07 obj_10)
)
 (:goal
  (and
   (pred_6 obj_04)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_04)) (not (pred_6 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_02)))
  )
)
)
