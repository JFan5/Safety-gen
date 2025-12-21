; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1734192254 --problem-name spanner-s2-n2-l3-s1734192254
(define (problem spanner-s2-n2-l3-s1734192254)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_05 obj_07 - type_5
     obj_02 obj_01 - type_4
     obj_03 obj_09 obj_08 - type_2
     obj_10 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_10)
    (pred_2 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_2 obj_07 obj_09)
    (pred_1 obj_07)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_04)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_04)
    (pred_6 obj_10 obj_03)
    (pred_6 obj_08 obj_04)
    (pred_6 obj_03 obj_09)
    (pred_6 obj_09 obj_08)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
