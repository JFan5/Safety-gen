(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_06 obj_08 - type_2
obj_01 obj_02 obj_09 obj_04 - type_3
obj_07 obj_03 obj_10 - object)
(:init
(pred_3 obj_05 obj_09)
(pred_1 obj_05 obj_06)
(pred_1 obj_05 obj_08)
(pred_4 obj_07 obj_01)
(pred_4 obj_03 obj_02)
(pred_4 obj_10 obj_01)
)
(:goal
(and
(pred_4 obj_07 obj_09)
(pred_4 obj_03 obj_02)
(pred_4 obj_10 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_05 ?b obj_08))))
)
)