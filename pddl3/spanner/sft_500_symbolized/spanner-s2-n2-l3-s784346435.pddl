; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 784346435 --problem-name spanner-s2-n2-l3-s784346435
(define (problem spanner-s2-n2-l3-s784346435)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_08 obj_09 - type_5
     obj_04 obj_02 - type_4
     obj_05 obj_06 obj_10 - type_2
     obj_03 obj_01 - type_2
    )
 (:init 
    (pred_2 obj_07 obj_03)
    (pred_2 obj_08 obj_10)
    (pred_1 obj_08)
    (pred_2 obj_09 obj_10)
    (pred_1 obj_09)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_01)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_01)
    (pred_6 obj_03 obj_05)
    (pred_6 obj_10 obj_01)
    (pred_6 obj_05 obj_06)
    (pred_6 obj_06 obj_10)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
