(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_01 obj_08 - type_2
obj_10 obj_07 obj_09 obj_02 - type_3
obj_04 obj_03 obj_05 - object)
(:init
(pred_1 obj_06 obj_09)
(pred_3 obj_06 obj_01)
(pred_3 obj_06 obj_08)
(pred_2 obj_04 obj_07)
(pred_2 obj_03 obj_07)
(pred_2 obj_05 obj_09)
)
(:goal
(and
(pred_2 obj_04 obj_10)
(pred_2 obj_03 obj_02)
(pred_2 obj_05 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_06 ?b obj_08))))
)
)