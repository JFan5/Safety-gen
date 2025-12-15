(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_08 obj_05 - type_3
obj_02 obj_10 obj_01 obj_09 - type_2
obj_07 obj_06 obj_04 - object)
(:init
(pred_3 obj_03 obj_01)
(pred_4 obj_03 obj_08)
(pred_4 obj_03 obj_05)
(pred_2 obj_07 obj_02)
(pred_2 obj_06 obj_01)
(pred_2 obj_04 obj_02)
)
(:goal
(and
(pred_2 obj_07 obj_01)
(pred_2 obj_06 obj_02)
(pred_2 obj_04 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_03 ?b obj_05))))
)
)