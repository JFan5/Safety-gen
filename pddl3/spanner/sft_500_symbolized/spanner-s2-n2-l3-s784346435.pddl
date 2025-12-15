; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 784346435 --problem-name spanner-s2-n2-l3-s784346435
(define (problem spanner-s2-n2-l3-s784346435)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_02 obj_05 - type_4
     obj_01 obj_04 - type_2
     obj_09 obj_03 obj_07 - type_1
     obj_08 obj_06 - type_1
    )
 (:init 
    (pred_3 obj_10 obj_08)
    (pred_3 obj_02 obj_07)
    (pred_2 obj_02)
    (pred_3 obj_05 obj_07)
    (pred_2 obj_05)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_06)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_06)
    (pred_1 obj_08 obj_09)
    (pred_1 obj_07 obj_06)
    (pred_1 obj_09 obj_03)
    (pred_1 obj_03 obj_07)
)
 (:goal
  (and
   (pred_5 obj_01)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_08)))
  )
)
)
