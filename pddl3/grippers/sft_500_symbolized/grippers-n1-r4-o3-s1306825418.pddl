(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_3
obj_07 obj_09 - type_1
obj_02 obj_03 obj_04 obj_06 - type_2
obj_05 obj_08 obj_10 - object)
(:init
(pred_3 obj_01 obj_06)
(pred_1 obj_01 obj_07)
(pred_1 obj_01 obj_09)
(pred_4 obj_05 obj_06)
(pred_4 obj_08 obj_04)
(pred_4 obj_10 obj_02)
)
(:goal
(and
(pred_4 obj_05 obj_03)
(pred_4 obj_08 obj_02)
(pred_4 obj_10 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_01 ?b obj_07))))
)
)