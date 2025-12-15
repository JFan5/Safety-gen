(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_08 obj_10 obj_03 obj_06 - type_2
obj_07 obj_04 obj_05 - type_3
obj_02 obj_11 - object)
(:init
(pred_3 obj_09 obj_05)
(pred_1 obj_09 obj_08)
(pred_1 obj_09 obj_10)
(pred_3 obj_01 obj_04)
(pred_1 obj_01 obj_03)
(pred_1 obj_01 obj_06)
(pred_2 obj_02 obj_04)
(pred_2 obj_11 obj_04)
)
(:goal
(and
(pred_2 obj_02 obj_05)
(pred_2 obj_11 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_09 obj_05) (pred_3 obj_01 obj_05))))
  )
)
)