; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 14799512 --problem-name spanner-s2-n2-l3-s14799512
(define (problem spanner-s2-n2-l3-s14799512)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_05 obj_09 - type_5
     obj_07 obj_03 - type_3
     obj_06 obj_10 obj_01 - type_2
     obj_02 obj_04 - type_2
    )
 (:init 
    (pred_1 obj_08 obj_02)
    (pred_1 obj_05 obj_06)
    (pred_6 obj_05)
    (pred_1 obj_09 obj_06)
    (pred_6 obj_09)
    (pred_2 obj_07)
    (pred_1 obj_07 obj_04)
    (pred_2 obj_03)
    (pred_1 obj_03 obj_04)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_01 obj_04)
    (pred_4 obj_06 obj_10)
    (pred_4 obj_10 obj_01)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
