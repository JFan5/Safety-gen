(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_04 - type_3
obj_07 obj_05 - type_1
obj_02 obj_01 obj_08 - type_2
obj_06 obj_03 obj_09 - object)
(:init
(pred_1 obj_04 obj_01)
(pred_2 obj_04 obj_07)
(pred_2 obj_04 obj_05)
(pred_4 obj_06 obj_01)
(pred_4 obj_03 obj_02)
(pred_4 obj_09 obj_01)
)
(:goal
(and
(pred_4 obj_06 obj_01)
(pred_4 obj_03 obj_01)
(pred_4 obj_09 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_04 ?b obj_05))))
)
)