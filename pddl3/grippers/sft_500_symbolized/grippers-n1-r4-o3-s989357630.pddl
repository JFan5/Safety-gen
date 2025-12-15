(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_06 obj_08 - type_1
obj_10 obj_04 obj_03 obj_02 - type_2
obj_09 obj_01 obj_05 - object)
(:init
(pred_4 obj_07 obj_03)
(pred_1 obj_07 obj_06)
(pred_1 obj_07 obj_08)
(pred_3 obj_09 obj_03)
(pred_3 obj_01 obj_02)
(pred_3 obj_05 obj_02)
)
(:goal
(and
(pred_3 obj_09 obj_03)
(pred_3 obj_01 obj_03)
(pred_3 obj_05 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_07 ?b obj_08))))
)
)