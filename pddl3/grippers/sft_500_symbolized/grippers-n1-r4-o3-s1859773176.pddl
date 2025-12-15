(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_07 obj_09 - type_3
obj_02 obj_04 obj_03 obj_05 - type_1
obj_08 obj_01 obj_10 - object)
(:init
(pred_1 obj_06 obj_04)
(pred_4 obj_06 obj_07)
(pred_4 obj_06 obj_09)
(pred_3 obj_08 obj_04)
(pred_3 obj_01 obj_02)
(pred_3 obj_10 obj_04)
)
(:goal
(and
(pred_3 obj_08 obj_02)
(pred_3 obj_01 obj_04)
(pred_3 obj_10 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_06 ?b obj_09))))
)
)