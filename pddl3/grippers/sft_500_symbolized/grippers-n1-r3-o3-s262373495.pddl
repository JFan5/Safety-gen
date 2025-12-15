(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_3
obj_08 obj_09 - type_2
obj_06 obj_07 obj_02 - type_1
obj_05 obj_04 obj_01 - object)
(:init
(pred_4 obj_03 obj_07)
(pred_1 obj_03 obj_08)
(pred_1 obj_03 obj_09)
(pred_2 obj_05 obj_07)
(pred_2 obj_04 obj_07)
(pred_2 obj_01 obj_06)
)
(:goal
(and
(pred_2 obj_05 obj_06)
(pred_2 obj_04 obj_07)
(pred_2 obj_01 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_03 ?b obj_08))))
)
)