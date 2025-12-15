(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_09 obj_10 - type_2
obj_05 obj_06 obj_02 obj_07 - type_3
obj_04 obj_01 obj_08 - object)
(:init
(pred_4 obj_03 obj_06)
(pred_1 obj_03 obj_09)
(pred_1 obj_03 obj_10)
(pred_2 obj_04 obj_05)
(pred_2 obj_01 obj_07)
(pred_2 obj_08 obj_02)
)
(:goal
(and
(pred_2 obj_04 obj_07)
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_03 ?b obj_10))))
)
)