(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_05 obj_04 - type_3
obj_07 obj_09 obj_06 obj_03 - type_2
obj_02 obj_08 obj_01 - object)
(:init
(pred_3 obj_10 obj_06)
(pred_4 obj_10 obj_05)
(pred_4 obj_10 obj_04)
(pred_2 obj_02 obj_06)
(pred_2 obj_08 obj_03)
(pred_2 obj_01 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_06)
(pred_2 obj_08 obj_06)
(pred_2 obj_01 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_10 ?b obj_04))))
)
)