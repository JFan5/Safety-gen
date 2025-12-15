(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_3
obj_02 obj_05 - type_2
obj_10 obj_07 obj_06 obj_09 - type_1
obj_08 obj_04 obj_03 - object)
(:init
(pred_1 obj_01 obj_07)
(pred_2 obj_01 obj_02)
(pred_2 obj_01 obj_05)
(pred_4 obj_08 obj_09)
(pred_4 obj_04 obj_07)
(pred_4 obj_03 obj_06)
)
(:goal
(and
(pred_4 obj_08 obj_07)
(pred_4 obj_04 obj_07)
(pred_4 obj_03 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_01 ?b obj_05))))
)
)