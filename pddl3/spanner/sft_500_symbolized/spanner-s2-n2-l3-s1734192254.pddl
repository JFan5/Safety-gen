; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1734192254 --problem-name spanner-s2-n2-l3-s1734192254
(define (problem spanner-s2-n2-l3-s1734192254)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_04 obj_06 - type_4
     obj_08 obj_10 - type_2
     obj_03 obj_01 obj_09 - type_1
     obj_05 obj_07 - type_1
    )
 (:init 
    (pred_6 obj_02 obj_05)
    (pred_6 obj_04 obj_01)
    (pred_4 obj_04)
    (pred_6 obj_06 obj_01)
    (pred_4 obj_06)
    (pred_1 obj_08)
    (pred_6 obj_08 obj_07)
    (pred_1 obj_10)
    (pred_6 obj_10 obj_07)
    (pred_5 obj_05 obj_03)
    (pred_5 obj_09 obj_07)
    (pred_5 obj_03 obj_01)
    (pred_5 obj_01 obj_09)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_08)) (not (pred_2 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
