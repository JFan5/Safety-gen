(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_07 obj_08 - type_3
obj_04 obj_06 obj_09 obj_05 - type_2
obj_10 obj_01 obj_03 - object)
(:init
(pred_2 obj_02 obj_06)
(pred_3 obj_02 obj_07)
(pred_3 obj_02 obj_08)
(pred_4 obj_10 obj_05)
(pred_4 obj_01 obj_09)
(pred_4 obj_03 obj_04)
)
(:goal
(and
(pred_4 obj_10 obj_09)
(pred_4 obj_01 obj_06)
(pred_4 obj_03 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_08))))
)
)