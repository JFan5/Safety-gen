(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_06 obj_04 - type_1
obj_01 obj_02 obj_10 obj_05 - type_2
obj_03 obj_09 obj_08 - object)
(:init
(pred_4 obj_07 obj_02)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_04)
(pred_1 obj_03 obj_02)
(pred_1 obj_09 obj_10)
(pred_1 obj_08 obj_01)
)
(:goal
(and
(pred_1 obj_03 obj_05)
(pred_1 obj_09 obj_05)
(pred_1 obj_08 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_07 ?b obj_04))))
)
)